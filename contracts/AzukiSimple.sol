// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import './ERC721A.sol';
import '@thirdweb-dev/contracts/ThirdwebContract.sol';

contract SimpleAzuki is ERC721A, ThirdwebContract {
    constructor(string memory name, string memory symbol) ERC721A(name, symbol) {}

    function mint(uint256 quantity) external payable {
        // _safeMint's second argument now takes in a quantity, not a tokenId.
        _safeMint(msg.sender, quantity);
    }
}
