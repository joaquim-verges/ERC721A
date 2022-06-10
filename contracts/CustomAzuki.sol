// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import './ERC721A.sol';
import '@thirdweb-dev/contracts/feature/interface/IMintableERC721.sol';
import '@thirdweb-dev/contracts/feature/Ownable.sol';
import '@thirdweb-dev/contracts/feature/Royalty.sol';
import '@thirdweb-dev/contracts/feature/ContractMetadata.sol';

/// @title Azuki contract that can be fully used in the thirdweb dashboard
contract CustomAzukiContract is ERC721A, Ownable, IMintableERC721, Royalty, ContractMetadata {
    mapping(uint256 => string) private uris;
    uint256 maximumSupply;

    /// @dev Custom constructor parameters, will be filled in on the dashboard before deploying
    constructor(uint256 maxSupply, string memory symbol) ERC721A('AzukiMint', symbol) {
        owner = msg.sender;
        maximumSupply = maxSupply;
    }

    /// @dev Modified Azuki mint function to accept a URI, and work in our dashboard
    /// @notice Test user comment TW WAS HERE
    function mintTo(address to, string calldata uri) external override returns (uint256) {
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

    function _canSetOwner() internal view override returns (bool) {
        return msg.sender == owner;
    }

    function _canSetRoyaltyInfo() internal view override returns (bool) {
        return msg.sender == owner;
    }

    function _canSetContractURI() internal view override returns (bool) {
        return msg.sender == owner;
    }
}
