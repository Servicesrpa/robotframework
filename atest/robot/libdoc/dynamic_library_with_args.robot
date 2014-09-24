*** Settings ***
Suite Setup       Run Libdoc And Parse Output    ${TESTDATADIR}/DynamicLibrary.py::required
Force Tags        regression    pybot    jybot
Resource          libdoc_resource.robot

*** Test Cases ***
Name
    Name Should Be    DynamicLibrary

Documentation
    Doc Should Start With    Dummy documentation for `__intro__`.

Version
    Version Should Match    0.1

Type
    Type Should Be    library

Generated
    Generated Should Be Defined

Scope
    Scope Should Be    test case

Named Args
    Named Args Should Be    yes

Init Documentation
    Init Doc Should Start With    0   Dummy documentation for `__init__`.

Init Arguments
    Init Arguments Should Be    0    arg1    arg2=This is shown in docs

Keyword Names
    Keyword Name Should Be     0    0
    Keyword Name Should Be     1    Keyword 1
    Keyword Name Should Be     2    KW 2

Keyword Arguments
    Keyword Arguments Should Be     0
    Keyword Arguments Should Be     1    arg1
    Keyword Arguments Should Be     2    arg1    arg2

Keyword Documentation
    Keyword Doc Should Start With    0   Dummy documentation for `0`.
    Keyword Doc Should Start With    1   Dummy documentation for `Keyword 1`.
    Keyword Doc Should Start With    2   Dummy documentation for `KW2`.

Non-ASCII Unicode
    Keyword Name Should Be    4    Nön-äscii Ünicöde
    Keyword Doc Should Be     4    Hyvää yötä.\n\nСпасибо! (Unicode)

Non-ASCII UTF-8
    Keyword Name Should Be    5    Nön-äscii ÜTF-8
    Keyword Doc Should Be     5    Hyvää yötä.\n\nСпасибо! (UTF-8)

No Argspec
    Keyword Arguments Should be     3     *varargs   **kwargs
