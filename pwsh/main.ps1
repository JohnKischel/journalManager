# JournalManager CLASS USAGE / EXAMPLES

# Set a bookname this variable is only for the reuse purpose.
$bookn = "MyFirstBook"

# Create an instance of class journalmanager.
$myJournal = [journalManager]::new(0)

# The method createBook creates a new bookname.json file in the instance librarypath
$myJournal.createBook($bookn)

# The method getAllBooks lists all books (.json files) in the librarypath of the created instance.
$myJournal.getAllBooks()

# Read the content of a book
$mb = $myJournal.readBook($bookn)

# Define a long description
$entry = @"
Heute wurden projekte in git eingecheckt.
Es wurde eine neue Entwicklungsumgebung installiert.
Wir haben einen JournalManager geschrieben.
"@

# Generate random chapters
$Chapter = [Chapter]::new((1..99999 | Get-Random -Count 1),"Introduction in an automated environment.",$entry)

# Add this chapter to your book
$myJournal.addChapter($bookn,$chapter)

# Remove chapters
$myJournal.removeChapter($bookn,@('96633','50497','75729','13431'))