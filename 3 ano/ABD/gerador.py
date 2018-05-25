import random

def read_file():
    return open("nomes.txt", "r")

# def random.randint(min, max):
#     list_numbers = list(range(min,max))
#     random.shuffle(list_numbers)
#     return list_numbers.pop()

def genarate_escola(cod, school_name, name,cod_instituicao, seed):
    body = []
    random.seed(seed)

    body.append( str(cod_instituicao+cod) ) # codigo da escola
    body.append( str(cod_instituicao) ) # codigo da instituição
    body.append(school_name) # nome da escola
    body.append(name) # pseudominio

    city_file = open("city.txt", "r")
    body.append( city_file.readline(random.randint(1,2699)).replace('\n','') ) # cidade

    body.append( random.choice(["Private", "Public"]) ) # modelo de ensino
    body.append( random.choice(["S", "N"]) ) # teste de admissao
    body.append( str(random.randint(1000,9999)) ) # codigo do estado
    body.append( random.choice(["S", "N"]) ) # Escola principal da instituição ?
    body.append( random.choice(["S", "N"]) ) # Esnsino doméstico
    body.append( random.choice(["S", "N"]) ) # ajuda financeira
    body.append( random.choice(["S", "N"]) ) # em funcionamento

    body.append( str(random.randint(10,99)) ) # classificação basica
    body.append( str(random.randint(10,99)) ) # classificação de estudadentes
    body.append( str(random.randint(10,99)) ) # classificação de espaços

    body.append( str(random.randint(1000000,9999999)) ) # valor propinas recebidas
    body.append( str(random.randint(100000,999999)) ) # proprinas de alunos internos
    body.append( str(random.randint(100000,999999)) ) # propinas de alunos externos

    body.append( str(random.randint(100000000,999999999)) ) # despesas da escola

    body.append( str(random.randint(1000000,9999999)) ) # media salarial
    body.append( str(random.randint(1000000,9999999)) ) # media de custo para estudantes
    body.append( str(random.randint(1000000,9999999)) ) # media de custo por curso
    body.append( str(random.randint(10000,99999)) ) # media rendimentos baixos
    body.append( str(random.randint(10000,99999)) ) # media rendimentos medios
    body.append( str(random.randint(1000000,9999999)) ) # media rendimentos altos

    body.append( str(random.randint(100000,999999)) ) # candidatura de apoio escolar

    body.append( str(random.randint(100,9999)) ) # estudantes femeninos
    body.append( str(random.randint(100,9999)) ) # estudantes masculinos
    body.append( str(random.randint(100,9999)) ) # estudantes dependentes
    body.append( str(random.randint(100,9999)) ) # estudantes veteranos
    body.append( str(random.randint(100,9999)) ) # estudantes primeira geração

    head = "INSERT INTO Escola VALUES ("
    tail = ");\n"

    file3 = open("escolas.txt", "a")
    string = body[0]
    for i in range(1, len(body)):
        string = string+","+body[i]

    file3.write(head+string+tail)

def genarate_inst(file,cod_instituicao, seed ):
    latitude  = random.randint(-1000,1000)
    longitude = random.randint(-1000,1000)

    first  = file.readline(random.randint(0,1219))
    first = first[:-1]
    last = file.readline(random.randint(0,1219))
    last = last[:-1]

    nome = first + last

    url_site = nome + ".site"
    url_precos = nome + ".precos"

    num_campus = random.randint(1,10)
    school_name = file.readline(random.randint(0,1219)).replace('\n','')
    name = school_name[0]+school_name[1]+"."

    cod_agencia = random.randint(1,10000)
    first  = file.readline(random.randint(0,1219))
    first = first[:-1]
    last = file.readline(random.randint(0,1219))
    last = last[:-1]

    nome_agencia ="Ang. "+ first +" "+ last

    for cod in range(0, num_campus):
        genarate_escola(cod, school_name, name,cod_instituicao, seed)

    head = "INSERT INTO Instituicao VALUES ("
    tail = ");\n"

    body =  str(cod_instituicao) +","+ str(latitude)+","+ str(longitude)+","+str(num_campus)+","+url_site+","+url_precos+","+str(cod_agencia)+","+nome_agencia
    return head + body + tail


file = read_file()
file2 = open("inst.txt", "w")
cod_instituicao = 1000
seed = 1
for i in range(0, 1):
    file2.write(genarate_inst(file,cod_instituicao, seed))
    cod_instituicao = cod_instituicao + 10
    seed = seed + 1
