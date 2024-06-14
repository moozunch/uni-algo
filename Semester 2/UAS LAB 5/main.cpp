#include <iostream>
#include <cstring>
#include <vector>
#include <algorithm>
#include <fstream>
#include "header/login.h"

using namespace std;

string searchCode;
bool found;

struct Date
{
    int day;
    int month;
    int year;
};

struct Ticket
{
    long price = 25000;
    string departure;
    string destination;
    string code;
    Date date;
    string time;
};

struct Todo
{
    string task;
    bool done;
};

class LoginSystem
{ // class admin
private:
    vector<Ticket> tickets;

public:
    void displayTickets()
    {
        system("CLS");
        if (tickets.empty())
        {
            cout << "No tickets available!" << endl;
            system("PAUSE");
        }
        else
        {
            system("CLS");
            cout << "Tickets List:" << endl;
            for (int i = 0; i < tickets.size(); i++)
            {
                cout << "------------------------" << endl;
                cout << "From " << tickets[i].departure << endl;
                cout << "To     : " << tickets[i].destination << endl;
                cout << "Date   : " << tickets[i].date.day << "/" << tickets[i].date.month << "/" << tickets[i].date.year << endl;
                cout << "Time   : " << tickets[i].time << endl;
                cout << "Price  : Rp" << tickets[i].price << '/' << "person" << endl;
                cout << "Code   : " << tickets[i].code << endl;
                cout << "------------------------" << endl;
            }
            system("PAUSE");
        }
    }

    void addTicket(const Ticket &ticket)
    {
        system("CLS");
        tickets.push_back(ticket);
        cout << "Ticket added successfully!" << endl;
        system("PAUSE");
    }

    void deleteTicket(const string &searchCode)
    {
        found = false;
        for (auto targetCode = tickets.begin(); targetCode != tickets.end(); targetCode++)
        {
            if (targetCode->code == searchCode)
            {
                system("CLS");
                targetCode = tickets.erase(targetCode);
                cout << "Ticket with code " << searchCode << " have been removed" << endl;
                found = true;
                system("PAUSE");
                break;
            }
        }
        if (!found)
        {
            system("CLS");
            cout << "There are no ticket with code " << searchCode << endl;
            system("PAUSE");
        }
    }

    void searchTicket(const string &searchCode)
    {
        
        found = false;
        for (auto const &ticket : tickets)
        {
            if (ticket.code == searchCode)
            {
                system("CLS");
                cout << "Ticket Found:" << endl;
                cout << "------------------------" << endl;
                cout << "From   : " << ticket.departure << endl;
                cout << "To     : " << ticket.destination << endl;
                cout << "Date   : " << ticket.date.day << "/" << ticket.date.month << "/" << ticket.date.year << endl;
                cout << "Time   : " << ticket.time << endl;
                cout << "Price  : Rp" << ticket.price << '/' << "person" <<  endl;
                cout << "Code   : " << ticket.code << endl;
                cout << "------------------------" << endl;
                found = true;
                system("PAUSE");
                break;
            }
        }
        if (!found)
        {
            system("CLS");
            cout << "There are no tickets with code " << searchCode << endl;
            system("PAUSE");
        }
    }
    
    Ticket getTicket(const string &searchCode)
    {
        found = false;
        Ticket foundTicket;
        
        for (const auto &ticket : tickets) 
        {
            if (ticket.code == searchCode)
            {
                foundTicket = ticket;
                found = true;
                break;
            }
        }

        if (!found)
        {
            return Ticket{};
        }
        else
        {
            system("CLS");
            cout << "Ticket Found:" << endl;
            cout << "------------------------" << endl;
            cout << "From   : " << foundTicket.departure << endl;
            cout << "To     : " << foundTicket.destination << endl;
            cout << "Date   : " << foundTicket.date.day << "/" << foundTicket.date.month << "/" << foundTicket.date.year << endl;
            cout << "Time   : " << foundTicket.time << endl;
            cout << "Price  : Rp" << foundTicket.price << '/' << "person" << endl;
            cout << "Code   : " << foundTicket.code << endl;
            cout << "------------------------" << endl;
            system("PAUSE");
            return foundTicket;
        }
    }
};

class TicketBookingSystem
{ // class pembeli
private:
    vector<Ticket> bookedTickets;
    vector<Todo> todos;

public:
    void bookTicket(const Ticket &ticket, LoginSystem &loginSystem)
    {
        system("CLS");
        bookedTickets.push_back(ticket);
        loginSystem.deleteTicket(ticket.code);
        cout << "Ticket booked successfully!" << endl;
        system("PAUSE");
    }

    void displayBookedTickets()
    {
        if (bookedTickets.empty())
        {
            system("CLS");
            cout << "No tickets bought yet!" << endl;
            system("PAUSE");
        }
        else
        {
            system("CLS");
            cout << "Bought Tickets:" << endl;
            for (const auto &ticket : bookedTickets)
            {
                cout << "------------------------" << endl;
                cout << "From           : " << ticket.departure << endl;
                cout << "To             : " << ticket.destination << endl;
                cout << "Date           : " << ticket.date.day << "/" << ticket.date.month << "/" << ticket.date.year << endl;
                cout << "Time           : " << ticket.time << endl;
                cout << "Price          : Rp" << ticket.price << '/' << "person " << endl;
                cout << "Code           : " << ticket.code << endl;
                cout << "------------------------" << endl;
            }
            system("PAUSE");
        }
    }

    vector<Ticket> getBookedTickets() const
    {
        return bookedTickets;
    }

    void addTodo(const string &task)
    {
        Todo todo;
        todo.task = task;
        todo.done = false;
        todos.push_back(todo);
        system("CLS");
        cout << "Todo added successfully!" << endl;
        system("PAUSE");
    }

    void displayTodos()
    {
        
        if (todos.empty())
        {
            system("CLS");
            cout << "No todos added yet!" << endl;
            system("PAUSE");
        }
        else
        {
            system("CLS");
            cout << "Todos:" << endl;
            for (const auto &todo : todos)
            {
                cout << "Task: " << todo.task << endl;
                cout << "Status: " << (todo.done ? "Done" : "Not Done") << endl;
                cout << "------------------------" << endl;
            }
            system("PAUSE");
        }
    }

    void markTodoAsDone(int index)
    {
        if (index >= 0 && index < todos.size())
        {
            system("CLS");
            todos[index].done = true;
            cout << "Todo marked as done!" << endl;
            system("PAUSE");
        }
        else
        {
            system("CLS");
            cout << "Invalid todo index!" << endl;
            system("PAUSE");
        }
    }

    void deleteTodo(int index)
    {
        
        if (index >= 0 && index < todos.size())
        {
            system("CLS");
            todos.erase(todos.begin() + index);
            cout << "Todo deleted successfully!" << endl;
            system("PAUSE");
        }
        else
        {
            system("CLS");
            cout << "Invalid todo index!" << endl;
            system("PAUSE");
        }
    }
};

int main()
{
    LoginSystem loginSystem;
    TicketBookingSystem bookingSystem;
    string username, password;
    const string savedUsername = "admin", savedPassword = "admin123";
    int option, login, index;

    do
    {
        login = loginOption();

        if (login == 1)
        { // admin
            system("CLS");
            cout << "Username: ";
            cin >> username;
            cout << "Password: ";
            cin >> password;

            if (statusLogin(username.c_str(), savedUsername.c_str(), password.c_str(), savedPassword.c_str()))
            {
                do
                {
                    showAdminMenu();
                    cout << "Choose an option: ";
                    cin >> option;

                    switch (option)
                    {
                    case 1:
                    {
                        loginSystem.displayTickets();
                        break;
                    }
                    case 2:
                    {
                        Ticket ticket;

                        do
                        {
                            cout << "Enter Departure    : ";
                            cin >> ticket.departure;
                        } while (containsDigit(ticket.departure));

                        do
                        {
                            cout << "Enter Destination  : ";
                            cin >> ticket.destination;
                        } while (containsDigit(ticket.destination));

                        do
                        {
                            cout << "Enter ticket code  : ";
                            cin >> ticket.code;
                        } while (containsDigit(ticket.code));

                        do
                        {
                            cout << "Enter Day (DD)     : ";
                            cin >> ticket.date.day;
                            cout << "Enter Month (MM)   : ";
                            cin >> ticket.date.month;
                            cout << "Enter Year (YYYY)  : ";
                            cin >> ticket.date.year;
                        } while (isValidDate(ticket.date.day, ticket.date.month, ticket.date.year));

                        do
                        {
                            cout << "Enter Time         : ";
                            cin >> ticket.time;
                        } while (ticket.time.size() != 5 || timeValidation(ticket.time));

                        loginSystem.addTicket(ticket);
                        break;
                    }
                    case 3:
                    {
                        do {
                            cout << "Enter ticket code: ";
                            cin >> searchCode;
                        } while (containsDigit(searchCode));

                        loginSystem.deleteTicket(searchCode);
                        break;
                    }
                    case 4:
                    {
                        do {
                            cout << "Enter ticket code: ";
                            cin >> searchCode;
                        } while (containsDigit(searchCode));

                        loginSystem.searchTicket(searchCode);
                        break;
                    }
                    case 5:
                    {
                        cout << "Exiting..." << endl;
                        break;
                        system("PAUSE");
                    }
                    default:
                    {
                        cout << "Invalid option!" << endl;
                        break;
                        system("PAUSE");
                    }
                    }
                } while (option != 5);
            }
            else
            {
                cout << "Invalid username or password!" << endl;
                system("PAUSE");
            }
        }
        else if (login == 2)
        { // User
            do
            {
                showUserMenu();
                cout << "Choose an option: ";
                cin >> option;

                switch (option)
                {
                case 1:
                {
                    do
                    {
                        cout << "Enter the ticket code: ";
                        cin >> searchCode;
                    } while (containsDigit(searchCode) || searchCode.empty());

                    Ticket ticket = loginSystem.getTicket(searchCode);
                    if (!ticket.code.empty())
                    {
                        bookingSystem.bookTicket(ticket, loginSystem);
                    }
                    else
                    {
                        cout << "Ticket with " << searchCode << " not found";
                    }
                    break;
                }
                case 2:
                {
                    bookingSystem.displayBookedTickets();
                    break;
                }
                case 3:
                {
                    loginSystem.displayTickets();
                    break;
                }
                case 4:
                {
                    vector<Ticket> bookedTickets = bookingSystem.getBookedTickets();
                    ofstream outFile("BookedTickets.txt");
                    for (const Ticket &ticket : bookedTickets)
                    {
                        outFile << "------------------------\n";
                        outFile << "Price       : " << ticket.price << "\n";
                        outFile << "Departure   : " << ticket.departure << "\n";
                        outFile << "Destination : " << ticket.destination << "\n";
                        outFile << "Date        : " << ticket.date.day << "/" << ticket.date.month << "/" << ticket.date.year << "\n";
                        outFile << "Time        : " << ticket.time << "\n";
                        outFile << "Code        : " << ticket.code << "\n";
                        outFile << "------------------------\n";
                    }
                    outFile.close();
                    cout << "Booked tickets have been printed to BoughtTickets.txt\n";
                    break;
                }
                case 5:
                {
                    int todoOption;
                    do
                    {
                        showTodoListMenu();
                        cout << "Choose an option: ";
                        cin >> todoOption;

                        switch (todoOption)
                        {
                        case 1:
                        {
                            string task;
                            cout << "Enter todo task: ";
                            cin.ignore();
                            getline(cin, task);
                            bookingSystem.addTodo(task);
                            break;
                        }
                        case 2:
                        {
                            bookingSystem.displayTodos();
                            break;
                        }
                        case 3:
                        {
                            cout << "Enter todo index: ";
                            cin >> index;
                            bookingSystem.markTodoAsDone(index);
                            break;
                        }
                        case 4:
                        {
                            cout << "Enter todo index: ";
                            cin >> index;
                            bookingSystem.deleteTodo(index);
                            break;
                        }
                        default:
                        {
                            cout << "Invalid option!" << endl;
                            break;
                        }
                        }
                    } while (todoOption != 5);
                    break;
                }
                default:
                {
                    cout << "Invalid option!" << endl;
                    break;
                    system("PAUSE");
                }
                }
            } while (option != 6);
        }
    } while (login != 3);

    return 0;
}
