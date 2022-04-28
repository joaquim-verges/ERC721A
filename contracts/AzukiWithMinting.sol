// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import './ERC721A.sol';
import '@thirdweb-dev/contracts/ThirdwebContract.sol';
import '@thirdweb-dev/contracts/feature/interface/IMintableERC721.sol';

contract AzukiWithMinting is ERC721A, ThirdwebContract, IMintableERC721 {
    constructor(string memory name, string memory symbol) ERC721A(name, symbol) {}

    mapping(uint256 => string) private uris;

    /// Adapted Azuki mint function to accept a URI, and work in our dashboard
    function mintTo(address to, string calldata uri) external returns (uint256) {
        uint256 id = _currentIndex;
        _safeMint(to, 1);
        uris[id] = uri;
        emit TokensMinted(to, id, uri);
        return id;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return uris[tokenId];
    }
}
