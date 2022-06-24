#include <iostream>

int main()
{
	long long int a = 0;
	long long int b = 0;
	long long int c = 0;
	long long int d = 0;
	std::cin >> a;
	c = a;
	//std::cout << a << " ";
	for (; c != 0;)
	{
		std::cout << std::endl;
		std::cout << c << " : ";
		for (; a != 1;)
		{
			if (a % 2 == 1)
			{
				b = a;
				b = 3 * b + 1;
				std::cout << b << " ";
				a = b;
			}
			else if (a % 2 == 0)
			{
				b = a;
				b = b / 2;
				std::cout << b << " ";
				a = b;
			}
		}
		std::cout << std::endl;
		c--;
		a = c;
		d++;
	}
	//std::cout << std::endl << "Converge at '1'! Complete!!";
	std::cout << std::endl << d;
	return 0;
}