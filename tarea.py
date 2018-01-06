
def matriz(xs):
    for i in range (len(xs)-1):
        if len(xs[i])==len(xs[i+1]):
            continue
        else:
            return False
    return True


def mostrar(x):
    
    for i in range(len(x)):
        for j in range(len(x[i])):
            print(x[i][j],end=" ")
        print()


def ingresar():
    f=int(input("Filas? "))
    c=int(input("Columnas? "))
    m=[]
    for i in range(f):
        m.append([0]*c)
    for i in range(f):
        for j in range(c):
            m[i][j]=int(input("Cual es elnumero de la fila "+str(i+1)+" columna "+str(j+1)+" "))
    return m


def identidad(xs):
    
    if cuadrada(xs)==True:
        for i in range (len(xs)):
            for j in range (len(xs[i])):
                if i!=j:
                    if xs[i][j]==0:
                        continue
                elif i==j:
                    if xs[i][j]==1:
                        continue
                    else:
                        return False

        return True
    else:
        print("No es cuadrada")
        
def esIdentidad():
    xs=ingresar()
    if  identidad(xs)== True:
        print("Es identidad")
    else:
        print("No es identidad")

def intercambiar():
    xs=ingresar()
    x=int(input("Fila X "))
    y=int(input("Fila Y "))
    a=xs[x-1]
    xs[x-1]=xs[y-1]
    xs[y-1]=a
    return xs

def transpuesta():
    xs=ingresar()
    ys=[]
    for i in range(len(xs[1])):
        ys.append([0]*len(xs))
    
    for i in range (len(xs[1])):
        for j in range (len(xs)):
            ys[i][j]=xs[j][i]
    print ()
    mostrar (ys)
