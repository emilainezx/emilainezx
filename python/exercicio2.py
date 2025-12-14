#herença
class Pessoa:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade

class Estudante(Pessoa):
    pass

aluno1 = Estudante('Ana', 20)
print(f"nome: {aluno1.nome}")