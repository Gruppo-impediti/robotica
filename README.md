# ROBOTICA
This repository contain code for the "Controllo dei robot" exam
The structure of repository is organized as follow:

# Progetto
## mass_spring_damper
Contain very simple tasks rapresenting the end-effector of a generic manipulator when an impedance control is used.
Three tasks are:
* grasping: lifting an object
* interaction: desired trajectory goes throw an obstacle
* instability: choice of variable impedance gain that make the system unstable

## RR
The equivalent of MDS but implemented on a RR arm.
Simple tasks are than merged into a task in wich the object is grasped, lifted and than brought to a shelf

## franka
The franka folder contain files for the simulation of the last task, grasping and placement.

# tavole
Tavole contains material about non linear analysis and control