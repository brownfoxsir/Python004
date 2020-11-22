class AnimalMixin:
    # 动物食肉吗
    def animal_type(self, kind):
        self.kind = kind
        return self.kind

    # 动物的体型
    def animal_shape(self, shape):
        self.shape = shape
        return self.shape

    # 动物的性格
    def animal_character(self, character):
        self.character = character
        return self.character

    # 是否为凶猛动物
    def animal_ferocious_meek(self):
        if self.kind == '食肉' and self.character == '凶猛' and self.shape == '中' or self.shape == '大':
            self.ferocious = '凶猛动物'
            return self.ferocious
        else:
            self.meek = '不是凶猛动物'
            return self.meek


class Cat(AnimalMixin):
    """ 
    param name: 动物名称
    param kind：动物食肉与否
    param shape: 动物体型
    param character：动物性格
    """

    sound = 'miaomiao'    

    def __init__(self, name, kind, shape, character):
        self.name = name
        self.kind = self.animal_type(kind)
        self.shape = self.animal_shape(shape)
        self.character = self.animal_character(character)
        

    def pet(self):
        if self.animal_ferocious_meek() == '凶猛动物':
            self.pets = '不适合做宠物'
            return self.pets
        else:
            self.pets = '适合做宠物'
            return self.pets


class Dog(AnimalMixin):
    """ 
    param name: 动物名称
    param kind：动物食肉与否
    param shape: 动物体型
    param character：动物性格
    """

    sound = 'wangwang'
    

    def __init__(self, name, kind, shape, character):
        self.name = name
        self.kind = self.animal_type(kind)
        self.shape = self.animal_shape(shape)
        self.character = self.animal_character(character)        

    def pet(self):
        if self.animal_ferocious_meek() == '凶猛动物':
            self.pets = '不适合做宠物'
            return self.pets
        else:
            self.pets = '适合做宠物'
            return self.pets


class Zoo:
    # 动物实例id集合
    animal_class_id = []
    # 动物名称集合
    zoo_animal_name = []

    def __init__(self, name):
        self.zoo_name = name
        
        

    def add_animal(self, kls):        
        if id(kls) in self.animal_class_id:
            raise Exception(f'实例id为:{id(kls)}的动物已经在动物园中,不能再进行添加')                
        else:
            self.animal_name = kls.name
            self.animal_character = kls.character
            self.animal_kind = kls.kind
            self.animal_shape = kls.shape
            self.pets = kls.pet()
            self.sound = kls.sound
            self.animal_class_id.append(id(kls))            
            self.zoo_animal_name.append(kls.name)
            setattr(self,type(kls).__name__,type(kls))
                


if __name__ == '__main__':
    # 实例化动物园
    z = Zoo('时间动物园')
    # 实例化一只猫，属性包括名字、类型、体型、性格
    cat1 = Cat('大花猫 1', '食肉', '小', '温顺')
    # 增加一只猫到动物园
    z.add_animal(cat1)
    # 使用hasattr
    print('动物园是否有猫这种动物:',hasattr(z,'Cat'))
    print(z.__dict__)
    # 实例化cat2
    dog1 = Dog('小狗 1', '食肉', '小', '温顺')
    z.add_animal(dog1)
    print('动物园是否有狗这种动物:',hasattr(z,'Dog'))
    print(z.__dict__)
    # 再次添加实例cat1到动物园实例z，会报错，同一个实例只能添加一次
    # z.add_animal(cat1)

