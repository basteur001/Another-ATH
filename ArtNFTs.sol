// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ArtNFTs is ERC721, Ownable {
    string private baseURI;
    uint   private id;
    uint   private total;
    uint   private num;

    constructor
    (
        string memory _imageURI,
        uint _id,
        uint _total
    )
        ERC721("ArtNFTs", "ARTs")
    {
        baseURI = _imageURI;
        id = _id;
        total = _total;
        num = 0;
    }

    function _baseURI()
    internal view virtual
    override returns (string memory)
    {
        return baseURI;
    }

    function tokenURI(uint256 tokenId)
    public view virtual
    override returns (string memory)
    {
        _requireMinted(tokenId);
        return _baseURI();
    }

    function getID()
    public view returns(uint)
    {
        return id;
    }

    function getTotal()
    public view returns(uint)
    {
        return total;
    }

    function getNum()
    public view returns(uint)
    {
        return num;
    }

    function _mintTo(address _to)
    internal returns (bool)
    {
        require(num < total, "ArtNFTs function _mintTo(address _to): Num should less than total !!!");
        _mint(_to, num);
        num++;
        return true;
    }
}
