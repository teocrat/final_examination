from home_animals import HomeAnimals


class Hamsters(HomeAnimals):
    def __init__(self, name, birthday, type_of_home_animals):
        super().__init__(type_of_home_animals)
        self.name = name
        self.birthday = birthday
