abstract class Vehicle {
  int _speed = 0; // Protected variable (private to the library, accessible within the class and subclasses)

  void setSpeed(int speed) {
    _speed = speed; // Non-abstract method to set the speed of the vehicle (Encapsulation method)
  }

  void move(); // Abstract method to be implemented by subclasses
}

class Car extends Vehicle {    // Subclass is  = vehicle, Class is = Car
  @override
  void move() {
    print("The car is moving at $_speed km/h"); // Implementation of move method
  }
}

void main() {
  Car myCar = Car(); // Creating an instance of Car
  myCar.setSpeed(200); // Setting the speed of the car using encapsulation (controlled access to _speed)
  myCar.move(); // Calling the move method to print the speed
}
