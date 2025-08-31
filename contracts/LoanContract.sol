pragma solidity ^0.8.0;

contract LoanContract {
    struct Loan {
        uint id;
        address borrower;
        address lender;
        uint amount;
        uint interestRate;
        uint term;
        bool isActive;
    }

    mapping(uint => Loan) public loans;
    uint public loanCount;

    event LoanCreated(uint id, address borrower, address lender, uint amount, uint interestRate, uint term);

    function createLoan(address _lender, uint _amount, uint _interestRate, uint _term) public {
        loanCount++;
        loans[loanCount] = Loan(loanCount, msg.sender, _lender, _amount, _interestRate, _term, true);
        emit LoanCreated(loanCount, msg.sender, _lender, _amount, _interestRate, _term);
    }

    // Other functions for managing loans will be implemented here.
}
