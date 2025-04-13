import 'dart:math';

class Car {
  String brand;
  String model;

  Car(this.brand, this.model);

  String describe() => 'This is a $brand $model.';
}

class PassengerCar extends Car {
  PassengerCar(String brand, String model) : super(brand, model);

  @override
  String describe() => 'Passenger car: $brand $model, built for comfort.';
}

class Fruit {
  String color;

  Fruit(this.color);

  String taste() => 'Fruits have different tastes.';
}

class Apple extends Fruit {
  Apple(String color) : super(color);

  @override
  String taste() => 'This $color apple tastes sweet and juicy.';
}

class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  String sound() => 'Animals make sounds.';
}

class Dog extends Animal {
  Dog(String name, int age) : super(name, age);

  @override
  String sound() => '$name barks: Woof!';
}

class Item {
  String name;
  double price;

  Item(this.name, this.price);

  String info() => 'Item info: $name, \$${price.toStringAsFixed(2)}';
}

class Product extends Item {
  Product(String name, double price) : super(name, price);

  @override
  String info() => 'Product: $name — costs \$${price.toStringAsFixed(2)}';
}

class Shape {
  double radius;

  Shape(this.radius);

  double area() => 0;
}

class Circle extends Shape {
  Circle(double radius) : super(radius);

  @override
  double area() => pi * radius * radius;
}

class Building {
  String type;

  Building(this.type);

  String describe() => 'This is a $type building.';
}

class House extends Building {
  House() : super('residential');

  @override
  String describe() => 'This is a cozy house.';
}

class Instrument {
  String type;

  Instrument(this.type);

  String play() => 'The instrument makes a sound.';
}

class Guitar extends Instrument {
  Guitar() : super('string');

  @override
  String play() => 'Strum strum 🎸 — the guitar plays a tune.';
}

class Human {
  String name;
  int age;

  Human(this.name, this.age);

  String greet() => 'Hello!';
}

class FriendlyHuman extends Human {
  FriendlyHuman(String name, int age) : super(name, age);

  @override
  String greet() => 'Hi, I\'m $name and I\'m $age years old! Nice to meet you!';
}
