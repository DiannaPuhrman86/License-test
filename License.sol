// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ContentLicense is ERC721, Ownable {
    uint256 public nextTokenId;
    mapping(uint256 => string) public tokenURIs;

    event LicenseMinted(address indexed owner, uint256 indexed tokenId, string tokenURI);

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

}
