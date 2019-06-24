*** Settings ***
Library  DatabaseLibrary

Test Setup  Connect to DB
Test Teardown  Disconnect from DB
*** Variables ***
${PATH_DB} =  C:\\Users\\joseangel.avila\\OneDrive - Accenture\\Documentos\\Robot Framework\\music\\music.db
@{TABLES_NAMES} =  songs  albums  artists
@{DESIRED_ARTISTS} =  Steve Vai  Joe Satriani  Jimi Hendrix
@{UNDESIRED_ARTISTS} =  Daddy Yankee  Calle 13  Don Omar
*** Test Cases ***

Demo
    Validate Tables
    Validate artists are in DB
    Validate artists are not in DB

*** Keywords ***

Connect to DB
    connect to database using custom params  sqlite3  database="${PATH_DB}"

Disconnect from DB
    disconnect from database

Validate Tables
    :FOR  ${table}  IN  @{TABLES_NAMES}
    \  table must exist  ${table}

Validate artists are in DB
    :FOR  ${artist}  IN  @{DESIRED_ARTISTS}
    \  check if exists in database  select * from artists where name='${artist}'

Validate artists are not in DB
    :FOR  ${artist}  IN  @{UNDESIRED_ARTISTS}
    \  check if not exists in database  select * from artists where name='${artist}'

