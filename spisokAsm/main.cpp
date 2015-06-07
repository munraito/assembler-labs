#include <iostream>
using namespace std;


extern "C"{
	void sort(char *, int);
	int findElem(char *, int, char);
	void insertElem(char *, int, char, int);
}
void printList(char *mas, int n){
	cout << "����� ������: " << endl;
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
	cout << "������� ������ ������: "; cin >> n;
	mas = new char[n];

	cout << "������� �������� ������: " << endl;
	for (int i = 0; i < n; i++) {
		cout << "mas[" << i << "] = ";
		cin >> mas[i];
	}

	//����������:
	sort(mas, n);
	printList(mas, n);

	//������� ������� � ���������� ��� �����:
	cout << "����� ������� ���� �����? " << endl; cin >> k;
	index =	findElem(mas, n, k);
	if (index > n || index < 0) cout << "������ �������� �� ����������" << endl;
	else cout << "��� ����� - " << index << endl;

	//��������� ����� ������� � ������ �����:
	cout << "������� �������, ������� ���� �������� � ������" << endl; cin >> newElem;
	cout << "������� ��� �������" << endl; cin >> newIndex;
	insertElem(mas, n, newElem, newIndex);
	printList(mas, n+1);
	return 0;
}