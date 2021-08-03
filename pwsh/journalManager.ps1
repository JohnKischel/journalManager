class journalManager{

    $LIBRARYPATH

    journalManager($libPath){
        if(-not $libPath){
            $libPath = "$PSScriptRoot/lib"
        }
        $this.LIBRARYPATH = $libPath
    }

    createBook($bookName){
        New-Item -Path $this.LIBRARYPATH -Name ("{0}.json" -f $bookName) -ItemType File -Value (@{} | ConvertTo-Json) -ErrorAction 0
    }

    [object] readBook($bookName){
        $BookObject = $this.getBook($bookName)
        return Get-Content -Path $BookObject.FullName | ConvertFrom-Json
    }

    [string[]] getAllBooks(){
        return (Get-ChildItem $this.LIBRARYPATH -Recurse).BaseName
    }

    [object] getBook($bookName){
        $bookPath = Join-Path -Path $this.LIBRARYPATH -ChildPath "$bookName.json"
        return (Get-Item $bookPath) | Select-Object Name,BaseName,FullName
    }

    addChapter($bookName,$chapter){
        $BookObject = $this.getBook($bookName)
        $book = Get-Content -Path $BookObject.FullName | ConvertFrom-Json
        $book | Add-Member -NotePropertyName $chapter.CHAPTERNAME -NotePropertyValue $chapter 
        $book | ConvertTo-Json | Out-File $BookObject.FullName
    }

    removeChapter($bookName,[string[]]$chapterName){
        $BookObject = $this.getBook($bookName)
        $book = Get-Content -Path $BookObject.FullName | ConvertFrom-Json
        foreach($cname in $chapterName){
            $book.PSObject.Properties.remove($cname)
        }
        $book | ConvertTo-Json | Out-File $BookObject.FullName
    }

}

class Chapter{

    $DATE
    $SHORTDESCRIPTION
    $CHAPTERCONTENT
    $CHAPTERNAME

    Chapter([string]$_chapterName,[string]$sDescription,$cContent){
        $this.DATE = Get-Date
        $this.CHAPTERNAME = $_chapterName
        $this.SHORTDESCRIPTION = $sDescription
        $this.CHAPTERCONTENT = $cContent
    }


}