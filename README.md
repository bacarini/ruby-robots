Toy Ruby Robot Simulator
========================

The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

Rules:
-----
* The robot is free to roam around the surface of the table, but must be prevented from falling to destruction.
* Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.
* PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
* The origin (0,0) can be considered to be the SOUTH WEST most corner.
* The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a valid PLACE command has been executed.
* MOVE will move the toy robot one unit forward in the direction it is currently facing.
* LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.


Requirements:
-------------

* Ruby 2.0.0
* Rspec 2.14.1

Test:
-----
```
Bundle Install
rspec spec/
```

Run:
----
The system includes not only input from file but also a STDIN.

To run execute the command `./bin/robots`

Example:
```
$ ./bin/robots

Welcome to Toy Ruby Robot Simulator
Be aware of the valid commands

=================
PLACE X,Y,FACING
LEFT
RIGHT
MOVE
REPORT
=================
The system will proceed to the file input. Would you like to enter your commands manually instead? (yes/no)
```
if you choose a manually input, you can put one of the valid command or exit to leave the system.

Example:
```
yes
Please, enter your command or type exit to leave the system:
```
