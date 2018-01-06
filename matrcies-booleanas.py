def multiplicar():
    print('Orden de la matriz 1')
    filas1 = int(input("filas: "))
    columnas1 = int(input("coloumnas: "))
    print('Orden de la matriz 2')
    filas2 = int(input("filas: "))
    columnas2 = int(input("columnas: "))

    if (columnas1==filas2):

            matriz1 = []
            for i in range(filas1):
                    matriz1.append( [0] * columnas1 )

            matriz2 = []
            for i in range(filas2):
                    matriz2.append( [0] * columnas2 )

            print ('Ingrese su Matriz 1')
            for i in range(filas1):
                    for j in range(columnas1):
                            while True:
                                matriz1[i][j]=int(input("elmento %d,%d: " %(i,j)))
                                if matriz1[i][j]==0 or matriz1[i][j]==1:
                                    break
            print ('Ingrese su Matriz 2')
            for i in range(filas2):
                    for j in range(columnas2):
                            while True:
                                matriz2[i][j]=int(input("elmento %d,%d: " %(i,j)))
                                if matriz2[i][j]==0 or matriz2[i][j]==1:
                                    break
            matriz3 = []
            for i in range(filas1):
                    matriz3.append( [0] * columnas2 )
            
            for i in range(filas1):
                    for j in range(columnas2):
                            for k in range(filas2):                                    
                                if matriz1[i][k]==1 and matriz2[k][j]==1:
                                        matriz3[i][j]=1
                                
            print ('Su matriz resultante es')
            print (matriz3)
    else:
            print ('NO PUEDEN SER EJECUTADAS :( ')

                  
