from humans_friends import Animals


class HomeAnimals(Animals):
    def __init__(self, type_of_home_animals, a_type):
        super().__init__(a_type)
        self.type_of_home_animals = type_of_home_animals


