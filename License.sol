// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ContentLicense is ERC721, Ownable {
    uint256 public nextTokenId;
    mapping(uint256 => string) public tokenURIs;

    event LicenseMinted(address indexed owner, uint256 indexed tokenId, string tokenURI);

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}
function mintLicense(address _to, string memory _tokenURI) external onlyOwner {
        uint256 tokenId = nextTokenId;
        nextTokenId++;

        _safeMint(_to, tokenId);
        _setTokenURI(tokenId, _tokenURI);

        emit LicenseMinted(_to, tokenId, _tokenURI);
    }
function setTokenURI(uint256 _tokenId, string memory _tokenURI) external onlyOwner {
        require(_exists(_tokenId), "Token does not exist");
        _setTokenURI(_tokenId, _tokenURI);
    }
}
