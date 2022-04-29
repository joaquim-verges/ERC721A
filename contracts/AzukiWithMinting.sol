// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import './ERC721A.sol';
import '@thirdweb-dev/contracts/ThirdwebContract.sol';
import '@thirdweb-dev/contracts/feature/interface/IMintableERC721.sol';

/// @title Azuki contract that can be fully used in the thirdweb dashboard
contract AzukiWithMinting is ERC721A, ThirdwebContract, IMintableERC721 {
    mapping(uint256 => string) private uris;
    uint256 maximumSupply;

    /// @dev Custom constructor parameters, will be filled in on the dashboard before deploying
    constructor(uint256 maxSupply, string memory symbol) ERC721A('AzukiMint', symbol) {
        maximumSupply = maxSupply;
    }

    /// @dev Modified Azuki mint function to accept a URI, and work in our dashboard
    function mintTo(address to, string calldata uri) external returns (uint256) {
        require(_currentIndex < maximumSupply, 'Maximum supply reached');
        uint256 id = _currentIndex;
        _safeMint(to, 1);
        uris[id] = uri;
        emit TokensMinted(to, id, uri);
        return id;
    }

    /// @dev Modified tokenURI to return more than just base URI
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return uris[tokenId];
    }
}
