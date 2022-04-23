## events

- event cannot be read from the smart contract itself. They can only be consumed from outside entities. Also, they cost less gas than storage variables.
- you can push data from smart contract to outside consumers, such as a UI

- first, declare your events on the contract level using the `event` keyword=>

```event NewTrade(
      uint date,
      address indexed from,
      address to,
       uint amount
  )
```

- `indexed` is used to filter the event according to the caller's liking. BUT, `indexed` are expensive. So, you can use maximum 3 indexes in a nevent.
- then, you need to use the `emit` that event in a function

````function trade ( address _to, uint _amount) external{
    emit NewTrade(now, msg.sender, _to, _amount)
}```
````

now, here when we emit the event, we give it the parameters that correspond the pieces in the order how we defined them. So, `now` is the solidity keyword that gets the current time and it corresponts to the uint date in the event, msg.sender is the address who's calling the contract and it corresponds to the `from` address in the event, and the last two are self explanatory.
