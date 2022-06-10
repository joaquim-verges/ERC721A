// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import './ERC721A.sol';
import '@thirdweb-dev/contracts/ThirdwebContract.sol';

/// @title Pure ERC721A contract that can be used with the thirdweb SDK
contract SimpleAzuki is ERC721A {
    constructor() ERC721A('SimpleAzuki', 'SAZ') {}

    /// @dev Default Azuki mint
    function mint(uint256 quantity) external payable {
        _safeMint(msg.sender, quantity);
    }
}
