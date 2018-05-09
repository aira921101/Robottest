*** Settings ***
Metadata  First run  [first_run_log.html|first_run_log.html]
Metadata  Second run  [second_run_log.html|second_run_log.html]

*** Variables ***
#robot --outputdir Tests/RetestExperiment --output original.xml Tests/RetestExperiment
#robot --rerunfailed Tests/RetestExperiment/original.xml  --outputdir Tests/RetestExperiment --output rerun.xml Tests/RetestExperiment
#rebot --outputdir Tests/RetestExperiment --merge Tests/RetestExperiment/original.xml Tests/RetestExperiment/rerun.xml
    ##Parallelism
#pabot --processes 5 --outputdir Tests/RetestExperiment/Original --output original.xml Tests/RetestExperiment
#pabot --processes 5 --rerunfailed Tests/RetestExperiment/Original/original.xml --outputdir Tests/RetestExperiment/Rerun --output rerun.xml Tests/RetestExperiment
#rebot --outputdir Tests/RetestExperiment/Final --merge Tests/RetestExperiment/Original/original.xml Tests/RetestExperiment/Rerun/rerun.xml

*** Test Cases ***

Test 1
    Simulate Test  1
Test 2
    Simulate Test  2
Test 3
    Simulate Test  3
Test 4
    Simulate Test  4
Test 5
    Simulate Test  5


*** Keywords ***
Simulate Test
    [Arguments]  ${test_number}
    log  Executing Test ${test_number}
    ${random_int}  Evaluate  random.randint(0, 1)  modules=random
    #${random_int}  convert to string  ${random_int}
    log  ${random_int}
    run keyword if  '${random_int}' == '0'  Fail  Got zero, failling test ${test_number}
    Log  Finished Test ${test_number}