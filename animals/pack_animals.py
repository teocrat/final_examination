from humans_friends import Animals


class PackAnimals(Animals):
    def __init__(self, type_of_pak_animal, a_type):
        super().__init__(a_type)
        self.type_of_pak_animals = type_of_pak_animal
