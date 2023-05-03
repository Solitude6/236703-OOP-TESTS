How To Run:
1) clone / download the repository
2) Drag the "OOP2Tests.java" file into the "Tests" folder in your project
(IntelliJ might tell you the file size exceeds some limit, ignore it, it doesn't effect execution)
3) Run the file

Notes:
* You need to have Junit added to your project, there is a guide for that on the course website
* This test DOES NOT test exceptions. The tests are meant to include only completly legal commands.
* Failed tests with "null" as the reason, are caused by exceptions thrown incorrectly by your code

How To Generate More Tests:
1) Open the "oop2_test_generator.py" file in a python IDE
2) Change parameters like "PERSON_COUNT", "TEST_COUNT" or "TEST_LENGTH"
* Don't increase the TEST_LENGTH too much as java has limits on the amount of lines in a try catch statement
3) Run the file
4) Repeat the "How To Run" steps with the new file