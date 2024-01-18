pragma solidity ^0.8.0;

contract ExpenseTracker {
    struct Expense {
        address user;
        string description;
        uint256 amount;
    }

    Expense[] public expenses;

    constructor() {
        expenses.push(Expense(msg.sender, "Groceries", 50));
        expenses.push(Expense(msg.sender, "Transportation", 30));
        expenses.push(Expense(msg.sender, "Dining out", 25));
    }

    function addExpense(string memory _description, uint256 _amount) public {
        expenses.push(Expense(msg.sender, _description, _amount));
    }

    function getTotalExpenses(address _user) public view returns (uint256) {
        // Your code here
        uint256 TotalExpenses = 0;

        for (uint256 i = 0; i < expenses.length; i++) {
            if (expenses[i].user == _user) {
                TotalExpenses += expenses[i].amount;
            }
        }
            return TotalExpenses;
    }
}
