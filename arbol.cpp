#include <iostream>
 using namespace std;

 template<class T>
 class Nodo{
     public:
        Nodo<T>  * m_pIz;
        Nodo<T>  * m_pDer;
             T     m_Dato;
     public:
       Nodo(T d){

          m_pDer=m_pIz=0;
          m_Dato=d;
       }
 };

 template<class T>
class SBT{
    private:
        Nodo<T>* m_pRoot;
    public:
        SBT()
        {
            m_pRoot=0;
        }
    void push(T d);
    bool find(T d,Nodo<T>**&p);
    bool add(T d);
    void inorden();
    void print();
    void mayor();
    void hermano(T d);
    void tio(T d);
    void padre(T d);
};
template<class T>
void SBT<T>::push(T d){
    if(m_pRoot==NULL){
        m_pRoot= new Nodo<T>(d);
    }
    else{
        Nodo<T>*tmp1=m_pRoot;
        Nodo<T>*tmp2=m_pRoot;
        while(tmp2){
            if(d==tmp2->m_Dato){return;}
            tmp1=tmp2;
            if(d>tmp2->m_Dato){tmp2=tmp2->m_pDer;}
            else{tmp2=tmp2->m_pIz;}
        }
        Nodo<T>*Nuevo=new Nodo<T>(d);
        if(d<tmp1->m_Dato){tmp1->m_pIz=Nuevo;}
        else{tmp1->m_pDer=Nuevo;}
    }
}

template<class T>
bool SBT<T>::find(T d,Nodo<T>**&p){
    p=&m_pRoot;
    while(*p){
        if ((*p)->m_Dato==d){return true;}
        if((*p)->m_Dato>d){
            p=&((*p)->m_pIz);
        }
        else{
            p=&((*p)->m_pDer);
        }
    }
    return false;
}
template<class T>
void SBT<T>::hermano(T d){
    if(m_pRoot==NULL){return;}
    else{
        Nodo<T>*tmp1=m_pRoot;
        Nodo<T>*tmp2=m_pRoot;
        while(tmp2->m_Dato!=d){
            tmp1=tmp2;
            if(d>tmp2->m_Dato){
                    tmp2=tmp2->m_pDer;
            }
            else{
                    tmp2=tmp2->m_pIz;
            }
        }
        if(d>tmp1->m_Dato){
            tmp1=tmp1->m_pIz;
            cout<<"HERMANO: "<<tmp1->m_Dato<<endl;
        }
        else{
            tmp1=tmp1->m_pDer;
            cout<<"HERMANO: "<<tmp1->m_Dato<<endl;
        }

    }
}

template<class T>
void SBT<T>::tio(T d){

//    T valor=padre(5);
//    cout<<"Tio: "<<valor<<endl;

}



template<class T>
void SBT<T>::padre(T d){
    if(m_pRoot==NULL){return;}
    else{
        Nodo<T>*tmp1=m_pRoot;
        Nodo<T>*tmp2=m_pRoot;
        while(tmp2->m_Dato!=d){
            tmp1=tmp2;
            if(d>tmp2->m_Dato){
                    tmp2=tmp2->m_pDer;
            }
            else{
                    tmp2=tmp2->m_pIz;
            }
        }

        cout<<"PADRE: "<<tmp1->m_Dato<<endl;
    }
}

template<class T>
bool SBT<T>::add(T d){
    Nodo<T>**q;
    if(find(d,q))return false;
    *q=new Nodo<T>(d);
    return true;
}

template<class T>
void SBT<T>::inorden(Nodo<T>*d=m_pRoot){
    if(d!=NULL){
        inorden(d->m_pIz);
        cout<<d->m_Dato;
        inorden(d->m_pDer);
    }

}


template<class T>
void SBT<T>::mayor(){
    Nodo<T>*tmp=m_pRoot;
    while(tmp->m_pDer!=NULL){
        tmp=tmp->m_pDer;
    }
    cout<<"MAYOR: "<<tmp->m_Dato<<endl;
}
int main(){
    SBT<int> A;
    A.add(20);
    A.add(10);
    A.add(35);
    A.add(15);
    A.add(5);
    A.padre(35);
    A.hermano(35);
    A.mayor();

    A.inorden();
}
