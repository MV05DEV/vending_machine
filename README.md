#  Vending Machine in Verilog

This repository contains a simple Verilog implementation of a vending machine that dispenses an item worth ₹15. It accepts ₹0, ₹5 and ₹10 coins, keeps track of inserted amounts, dispenses the item when ₹15 is reached, and returns change if needed.

**#Features**

- Accepts ₹0 (`2'b00`), ₹5 (`2'b01`) and ₹10 (`2'b10`) coins.
- Dispenses item when ₹15 is collected.
- Returns appropriate change if more than ₹15 is inserted.
- FSM-based implementation with 3 states: ₹0, ₹5, ₹10.
