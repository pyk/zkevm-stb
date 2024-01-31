// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {L2TokenConverter} from "@src/L2TokenConverter.sol";

/**
 * @title L2TokenConverterV2
 * @author sepyke.eth
 */
contract L2TokenConverterV2 is L2TokenConverter {
    /// @custom:storage-location erc7201:pyk.storage.L2TokenConverterV2
    struct L2TokenConverterV2Storage {
        uint256 value;
    }

    // keccak256(abi.encode(uint256(keccak256("pyk.storage.L2TokenConverterV2")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant L2TokenConverterV2StorageLocation = 0x8f0689cc4e388096040b5581cec9eff8a09e159363c33d40489b11add3a35600;

    function _getL2TokenConverterV2Storage() private pure returns (L2TokenConverterV2Storage storage $) {
        assembly {
            $.slot := L2TokenConverterV2StorageLocation
        }
    }

    function setValue(uint256 _value) public {
        L2TokenConverterV2Storage storage $ = _getL2TokenConverterV2Storage();
        $.value = _value;
    }

    function getValue() public view returns (uint256 _value) {
        L2TokenConverterV2Storage storage $ = _getL2TokenConverterV2Storage();
        _value = $.value;
    }
}
