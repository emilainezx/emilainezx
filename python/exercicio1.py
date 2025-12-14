#agregação e composição
class Produto:
    def __init__(self, nome, preco):
        self.nome = nome
        self.preco = preco

    def exibir_info(self):
        print(f"nome: {self.nome}")
        print(f"preço: R$ {self.preco:.2f}")

class Estoque:
    def __init__(self):
        self.itens = []

    def adicionar_produto(self, produto):
        self.itens.append(produto)
        print(f"Produto '{produto.nome}' adicionado ao estoque.")
    
    def remover_produto(self,produto):
        if produto in self.itens:
            self.itens.remove(produto)
            print(f"Produto '{produto.nome}' removido do estoque.")
        else :
            print("produto não encontrado no estoque.")

class CPU:
    def __init__(self, marca, velocidade):
        self.marca = marca
        self.velocidade = velocidade
    
    def exibir_info(self):
        print(f"CPU: {self.marca} - {self.velocidade}Ghz")

class Laptop:
    def __init__(self, modelo):
        self.modelo = modelo
        self.cpu = CPU("Intel", 3.5)

    def exibir_detalhes(self):
        print(f"Modelo: {self.modelo}")
        self.cpu.exibir_info