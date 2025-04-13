class Human {
  String name;
  int age;

  Human(this.name, this.age);

  String getName() {
    return name;
  }

  int getAge() {
    return age;
  }
}

class Car {
  String color;
  int year;
  String model;

  Car(this.color, this.year, this.model);

  String getModel() {
    return model;
  }

  int getYear() {
    return year;
  }

  String getColor() {
    return color;
  }
}

class Family {
  String nationality;
  int amount_ofPeople;
  String degree_of_relationship;

  Family(this.amount_ofPeople, this.degree_of_relationship, this.nationality);

  String getNationality() {
    return nationality;
  }

  String getDegree() {
    return degree_of_relationship;
  }

  int getAmount() {
    return amount_ofPeople;
  }
}

class Cat {
  String color;
  int age;
  String nickname;
  String breed;
  String ownerName;

  Cat(this.color, this.age, this.nickname, this.breed, this.ownerName);

  String getColor() {
    return color;
  }

  String getName() {
    return nickname;
  }

  int getAge() {
    return age;
  }

  String getBreed() {
    return breed;
  }

  String getOwnerName() {
    return ownerName;
  }
}

class Calculator {
  int a;
  int b;

  Calculator(this.a, this.b);

  int getA() => a;
  int getB() => b;

  int sum() => a + b;

  int product() => a * b;
}

class BankAccount {
  String ownerName;
  double balance;
  String account_number;

  BankAccount(this.ownerName, this.account_number, this.balance);

  String getOwnerName() => ownerName;
  String getAccountNumber() => account_number;
  double getBalance() => balance;

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
    } else {
      print('Insufficient funds or invalid amount.');
    }
  }
}

class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  String getName() => name;
  double getPrice() => price;
  int getQuantity() => quantity;

  double totalCost() {
    return price * quantity;
  }
}

class Product2 {
  String name;
  double price;

  Product2(this.name, this.price);

  // Геттеры
  String getName() => name;
  double getPrice() => price;

  void increasePrice(double percent) {
    price += price * (percent / 100);
  }
}

class Person {
  String name;
  DateTime birthDate;

  Person(this.name, this.birthDate);

  String getName() => name;
  DateTime getBirthDate() => birthDate;

  int calculateAge() {
    DateTime now = DateTime.now();
    int age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}

void main() {}
