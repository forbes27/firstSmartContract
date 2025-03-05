//SPDX-License-Identifier: MIT
pragma solidity 0.8.18; //hardcoded solidity version, 0.8.18
//pragma solidity ^0.8.18; //solidity version of 0.8.18 or above
//pragma solidity >=0.8.18 < 0.9.0; //this is a range of solidity versions

contract SimpleStorage {
    //Basic Types: 
    //uint (unsigned integer, aka positive whole number with no decimals
    //int (signed integer, positive/negative whole number)
    //address
    //bytes - low level data type

    /*************
    bool hasFavouriteNumber = true; 
    uint favouriteNumber = 88; //defaults to uint256
    int256 faveNumber = -99; //the max number of bits is 256
    string favouriteNumberInText = "eighty-eight"; //strings are bytes objects for text, and can be easily converted to bytes objects
    address myAddress = 0x71C7656EC7ab88b098defB751B7401B5f6d8976F;
    bytes32 favourityBytes32 = "cat"; //hex code of the bytes. the max is bytes32
    bytes // bytes is a different object. it does not default to byte32 like uint 
    *******/

    uint256 myFavouriteNumber; // defaults to 0, defaults to an internal state variable, defaults to a storage (permanent) variable

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

  //  Person public fred = Person(7,"Fred");
  //  Person public lewis = Person({favouriteNumber: 9, name: "Lewis"});

    Person[] public listOfPeople; //defaults to []
    //Person[3] public staticList; //max of 3 persons

    //e.g. chelsea -> 232
    mapping(string => uint256) public nameToFavouriteNumber;


    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber; //sends a transaction to the blockchain
    }
    //deploying a contract uses the same process as sending transactions back and forth with ETH
    //anything that modifies any value on the blockchain is done via transaction

    //view, pure - 2 function types that don't require a transaction, as it is just reading state from the blockchain

    function retrieve () public view returns (uint) { //similar to making favouriteNumber a public variable
        return myFavouriteNumber;
    } //pure disallows modifying state, and disallows reading from state/storage

    /***visibility specifiers for variables/functions (NB: Everything on chain is technically public though) 
    public - visible externally and internally (other contracts/people can call the function or variable)
    private - only visible in current contract (not a good way to "hide" the value due to EVM being a public blockchain)
    external - only visible externally, and only tied to functions. other functions in the contract cannot call the function
    internal - only visible internally and by child contracts
    ****/

    //input data on the transaction contains machine readable code associated with the contract: e.g. below
    //0x608060405234801561001057600080fd5b5060e38061001f6000396000f3fe6080604052348015600f57600080fd5b506004361060285760003560e01c80636057361d14602d575b600080fd5b60436004803603810190603f91906085565b6045565b005b8060008190555050565b600080fd5b6000819050919050565b6065816054565b8114606f57600080fd5b50565b600081359050607f81605e565b92915050565b6000602082840312156098576097604f565b5b600060a4848285016072565b9150509291505056fea2646970667358221220f7efdb3769a1f55be9a7d3e8d12f3272a31f6d088a0ca3e21349e8b51c7a975464736f6c63430008120033


    //strings must specific if they use calldata or memory; both are variable options that are temporary and only exist for the duration of the call 
    //memory - a temporary variable that can be modified
    //calldata - a temporary variable that cannot be modified
    //storage - a permanent variable that can be modified.
    //structs, mappings, arrays (and strings which are an array of bytes) need to have the memory/calldata keyword 

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        // Person memory newPerson = Person(_favouriteNumber, _name);
        // listOfPeople.push(newPerson);

        listOfPeople.push(Person(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}

