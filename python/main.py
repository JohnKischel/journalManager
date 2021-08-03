import journalManager
import os

libPath = os.path.join(os.path.dirname(os.path.abspath(__file__)),'lib2')
myjournal = journalManager.JournalManager(libPath)
myjournal.createBook('MyFirstPythonBook')

mycontent = """
Das ist mein
Content um zu zeigen es geht
"""

myChapter = journalManager.Chapter('MyChapter','short description of my chapter',mycontent)
myjournal.addChapter('MyFirstPythonBook',myChapter)

myChapter = journalManager.Chapter('MyChapter2','short description of my chapter',mycontent)
myjournal.addChapter('MyFirstPythonBook',myChapter)

myjournal.removeChapter('MyFirstPythonBook','MyChapter2')
myjournal.readBook('MyFirstPythonBook')
myjournal.createBook('MySecondPythonBook')