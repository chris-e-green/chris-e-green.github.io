# Screenplay Suite — a guide for beta testers

These three iPhone and iPad apps help you find and prepare screenplay material for auditions, self-tapes and rehearsal. They serve different parts of the workflow: creating a catalogue, using a catalogue, or working with your own private script library.

You can test one app or several. You do not need all three, and no account or sign-in is required inside the apps.

## Which app am I installing?

| App | What it is for | Where your material comes from |
| --- | --- | --- |
| **Screenplay Analyser Lite** | Import and review screenplays, identify characters and acting passages, and create catalogues for Reader. | Fountain files or PDFs you import. |
| **Screenplay Finder Reader** | Find, organise and rehearse acting material from prepared catalogues. | The included catalogue and additional Reader catalogues you open. |
| **Script Library Prototype** | Import your own scripts, review their analysis, and read and rehearse the resulting material in one app. | Your own imported scripts; the library starts empty. |

Analyser Lite is not a trial-size app. Its focus is on local screenplay analysis and catalogue preparation; it does not provide the desktop Analyser’s more complex language-model enrichment.

Script Library Prototype combines authoring and reading for a private library. You do not need to move your scripts between Analyser Lite and Reader to use it.

## Analyser Lite: turn scripts into a catalogue

### 1. Import a screenplay

Use **Import** to choose a Fountain screenplay or a PDF with selectable text. For scanned pages, choose **Import PDF with OCR** and review the recognised text before accepting it. OCR recognises printed text from page images; the current workflow supports English.

Your original source is retained. Use a script you have permission to process.

### 2. Check the analysis

The app identifies screenplay elements such as scene headings, character cues, action and dialogue. It uses these to identify characters and suggest monologues and dialogue passages that may be useful for acting work.

Review the parsing, character profiles and suggested material. The line editor lets you correct groups of lines and speaker assignments. If something looks wrong, compare it with the original script before changing it.

### 3. Prepare a Reader catalogue

Mark **“I have reviewed the parsing, characters and selected material”** in **Overview** when you have completed your review.

You can export either:

- **References only:** information about scripts, characters and passages. This does not give Reader the screenplay content to display.
- **Sources and reading copies:** includes screenplay content, with the required distribution rights recorded for every included script.

Open the exported catalogue in Reader to browse and rehearse its material. Importing a script does not itself establish permission to distribute it.

## Reader: find and rehearse material

### 1. Find a passage

Browse the included catalogue or open another Reader catalogue. Search and filter to find material that suits your needs.

Whether you can read the screenplay depends on the sources supplied with the catalogue. A references-only catalogue provides information and locations, but cannot display the screenplay itself.

### 2. Organise your choices

Open passages, save favourites and organise shortlists with your notes. Reading positions and bookmarks help you return to material you are working on.

### 3. Prepare for rehearsal

Where the required sources are available, prepare rehearsal PDFs or print a reading list. For supported original PDFs, rehearsal copies can identify **Start** and **Finish** and cross out material outside the selected piece.

Always check those boundaries against the original. If the page layout cannot be matched confidently, the app may provide extracted pages without markings instead.

## Script Library Prototype: your own library, from import to rehearsal

### 1. Add a script

Start in **My scripts** and use **Import** for Fountain or PDF files. Scanned PDFs can use reviewed English OCR. No sample screenplay is bundled with this app, so bring a permitted script of your own.

### 2. Review the results

Check the parsing, characters and suggested acting material using the authoring tools. You can correct the results and edit character profiles.

Optional Apple Intelligence profile suggestions are an extra aid, not a required step. They depend on compatible hardware, system software and Apple Intelligence settings. You can use the main import, editing, reading and rehearsal workflow without them.

### 3. Save and read

Choose **Save & read** or **Read & rehearse**, as shown, to browse material from your saved scripts. Use favourites, shortlists and bookmarks, and prepare private rehearsal PDFs.

There is no catalogue export/import step between editing and reading your own library. Preparing a private reading copy does not approve it for distribution to other people.

## Character profiles and source evidence

Age and gender presentation are editable casting information. Source-based assessments use screenplay text and character descriptions; optional AI suggestions can also be reviewed where available.

**Builds differ:** the onboarding update introduces automatic filling of empty age and presentation fields when the source directly supports a value. It retains the supporting evidence and preserves existing values and manual overrides. Earlier beta builds require you to open each character, run the source check and accept its suggestions individually.

An educated guess remains separate from an explicitly supported description. You can inspect the evidence, change a value or leave it unknown. “Supported by the source” means the app found evidence; it is not a guarantee that every interpretation is correct.

## Your files, privacy and backups

Scripts and analysis are stored locally in the app. There is no automatic cross-device sync: installing on both an iPhone and an iPad does not automatically share their libraries.

Use the backup appropriate to the app:

| App | What to keep |
| --- | --- |
| **Analyser Lite** | Use **Save project backup** for your editable library. A Reader catalogue is not an editable project backup. |
| **Reader** | Use personal backup and recovery for your reading data. Keep your catalogue source files separately. |
| **Script Library Prototype** | Use **Library backup and recovery** for a complete copy of scripts and reading data. |

Exported files and backups may contain private screenplay material. Choose carefully where you save or share them, and keep a backup before installing beta updates or trying a restore.

## What we would like you to test

Try a small, complete journey first: import and review one script, find one useful passage, or prepare one rehearsal copy. Then try your normal working habits.

Please tell us whether:

- The app’s purpose and next useful action are clear.
- The analysis finds useful acting material and assigns dialogue to the right characters.
- Corrections, manual profile edits and saved work remain as expected after reopening the app.
- PDF boundaries and markings match the original screenplay.
- Saving, sharing, printing and backup/recovery behave as expected on your device.

Parsing, OCR, profile suggestions and PDF markings all need human checking during the beta. The **What to Test** notes in TestFlight describe requests and known issues for your particular build. Newer builds also include a **Getting started** guide inside the app.

When reporting a problem, include the app name and build, your device and OS version, what you did, what you expected, and what happened. Screenshots can help, but check them for private material before sending them. Do not send screenplay content unless you have permission to share it.
