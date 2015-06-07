#include <iostream>
using namespace std;


extern "C"{
	void sort(char *, int);
	int findElem(char *, int, char);
	void insertElem(char *, int, char, int);
}
void printList(char *mas, int n){
	cout << "Новый список: " << endl;
	for (int i = 0; i < n; i++) {

		cout << "mas[" << i << "] = " << mas[i] << "\t";
	}
	cout << endl;
}
int main()
{
	setlocale(LC_ALL, "Russian");
	int n, index, newIndex;
	char *mas, k, newElem;
	cout << "Введите размер списка: "; cin >> n;
	mas = new char[n];

	cout << "Введите элементы списка: " << endl;
	for (int i = 0; i < n; i++) {
		cout << "mas[" << i << "] = ";
		cin >> mas[i];
	}

	//СОРТИРОВКА:
	sort(mas, n);
	printList(mas, n);

	//НАХОДИМ ЭЛЕМЕНТ И ВОЗВРАЩАЕМ ЕГО НОМЕР:
	cout << "Какой элемент надо найти? " << endl; cin >> k;
	index =	findElem(mas, n, k);
	if (index > n || index < 0) cout << "Такого элемента не существует" << endl;
	else cout << "Его номер - " << index << endl;

	//ДОБАВЛЯЕМ НОВЫЙ ЭЛЕМЕНТ В НУЖНОЕ МЕСТО:
	cout << "Введите элемент, который надо добавить в список" << endl; cin >> newElem;
	cout << "Введите его позицию" << endl; cin >> newIndex;
	insertElem(mas, n, newElem, newIndex);
	printList(mas, n+1);
	return 0;
}