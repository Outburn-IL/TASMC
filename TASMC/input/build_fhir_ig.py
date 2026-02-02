from docx import Document
from pathlib import Path
from zipfile import ZipFile
import re, os, shutil

# === CONFIG ===
doc_path = Path("IG - סוראסקי מעבדות.docx")
base = Path("input")
page_dir = base / "pagecontent"
intro_dir = base / "intro-notes"
img_dir = base / "images"

# === RESET STRUCTURE ===
if base.exists(): shutil.rmtree(base)
for p in (page_dir, intro_dir, img_dir): p.mkdir(parents=True, exist_ok=True)

# === EXTRACT IMAGES FROM DOCX ===
with ZipFile(doc_path, "r") as z:
    for f in z.namelist():
        if f.startswith("word/media/"):
            img_data = z.read(f)
            out = img_dir / Path(f).name
            with open(out, "wb") as w: w.write(img_data)

# === PARSE DOCUMENT ===
doc = Document(doc_path)
sections = {}
title, buf = None, []
for p in doc.paragraphs:
    t = p.text.strip()
    if not t: continue
    if p.style.name.startswith("Heading"):
        if title: sections[title] = "\n".join(buf); buf = []
        title = t
    else: buf.append(t)
if title: sections[title] = "\n".join(buf)

# === PAGECONTENT ===
for title, body in sections.items():
    name = re.sub(r'[\\/*?:"<>|]', "_", title)
    file = page_dir / f"{name}.md"
    with open(file, "w", encoding="utf-8") as f:
        f.write(f"## {title}\n\n{body}\n")

# === INTRO-NOTES ===
conformance_prefixes = {
    "t17-": "StructureDefinition-",
    "Tofes17": "ValueSet-",
    "ILCore": "Extension-"
}
for t in sections:
    for key, prefix in conformance_prefixes.items():
        if t.startswith(key):
            out = intro_dir / f"{prefix}{t}-intro.md"
            with open(out, "w", encoding="utf-8") as f:
                f.write(f"## {t}\n\n{sections[t]}\n")

# === PLACEHOLDER PDFs ===
for name in [
    "T17-B - Business Flow.pdf",
    "Tofes_17_A.pdf",
    "T17-Decision-Request.pdf",
    "T17-Decision-Response.pdf"
]:
    (img_dir / name).write_bytes(b"%PDF-1.4\n%Placeholder\n")

# === ZIP IT ===
zip_path = Path("FHIR_IG_input.zip")
with ZipFile(zip_path, "w") as zipf:
    for root, _, files in os.walk(base):
        for f in files:
            p = Path(root) / f
            zipf.write(p, p.relative_to(base.parent))

print(f"Created {zip_path}")
