import json
import os
import glob

class JournalManager:
    
    def __init__(self,libraryPath):
        """
        Initialize the instance library path variable.
        This variable is used to build all upcoming pathes.
        Only change this variable iif you know wich methods are affected.
        """
        self.LIBRARYPATH = libraryPath

    def createBook(self,bookName):
        
        bookPath = os.path.join(self.LIBRARYPATH,'{}.json'.format(bookName))
        os.makedirs(self.LIBRARYPATH,exist_ok=True)
        with open(bookPath,'w+') as book:
            json.dump({},book)

    def readBook(self,bookName):
        bookPath = self.getBook(bookName).pop()
        with open(bookPath,'r') as book:
            print(json.load(book))

    def getAllBooks(self):
        return glob.glob('**/*/{}.json',recursive=True)

    def getBook(self,bookName):
        return glob.glob('**/*/{}.json'.format(bookName),recursive=True)

    def addChapter(self,bookName,chapter):
        bookPath = self.getBook(bookName).pop()
        with open(bookPath,'r') as book:
            jsonObj = json.load(book)
            jsonObj.update({chapter.CHAPTERNAME : chapter.__dict__})
        
        with open(bookPath, mode='w', encoding='utf-8') as feedsjson:
            json.dump(jsonObj, feedsjson,indent=4)

    def removeChapter(self,bookName,chapterName):
        bookPath = self.getBook(bookName).pop()
        with open(bookPath,'r') as book:
            jsonObj = json.load(book)
            jsonObj.pop(chapterName,None)
        
        with open(bookPath, mode='w', encoding='utf-8') as feedsjson:
            json.dump(jsonObj, feedsjson,indent=4)


class Chapter:

    def __init__(self,chapterName,description,content):
        self.CHAPTERNAME = chapterName
        self.DESCRIPTION = description
        self.CONTENT = content

