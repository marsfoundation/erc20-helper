// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.7;

import { SafeERC20 } from "../../src/SafeERC20.sol";

contract SafeERC20Wrapper {

    function safeTransfer(address token, address to, uint256 amount) external {
        SafeERC20.safeTransfer(token, to, amount);
    }

    function safeTransferFrom(address token, address from, address to, uint256 amount) external {
        SafeERC20.safeTransferFrom(token, from, to, amount);
    }

    function safeApprove(address token, address spender, uint256 amount) external {
        SafeERC20.safeApprove(token, spender, amount);
    }

}
