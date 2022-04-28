// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import './ERC721A.sol';
import '@thirdweb-dev/contracts/ThirdwebContract.sol';
import '@thirdweb-dev/contracts/feature/interface/IMintableERC721.sol';

contract AzukiWithMinting is ERC721A, ThirdwebContract, IMintableERC721 {
    constructor(string memory name, string memory symbol) ERC721A(name, symbol) {}

    function mintTo(address to, string calldata uri) public override returns (uint256);
        // _safeMint's second argument now takes in a quantity, not a tokenId.
        _safeMint(msg.sender, quantity);
    }
}
