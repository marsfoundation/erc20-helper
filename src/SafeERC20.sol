// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import { IERC20 } from "./interfaces/IERC20.sol";

/**
 * @title Small Library to standardize erc20 token interactions.
 */
library SafeERC20 {

    /**********************************************************************************************/
    /*** Internal Functions                                                                     ***/
    /**********************************************************************************************/

    function safeTransfer(address token, address to, uint256 amount) internal {
        require(
            _call(token, abi.encodeWithSelector(IERC20.transfer.selector, to, amount)),
            "SafeERC20/transfer-failed"
        );
    }

    function safeTransferFrom(address token, address from, address to, uint256 amount) internal {
        require(
            _call(token, abi.encodeWithSelector(IERC20.transferFrom.selector, from, to, amount)),
            "SafeERC20/transfer-from-failed"
        );
    }

    function safeApprove(address token, address spender, uint256 amount) internal {
        // Try to call approve with amount, if that doesn't work, set to 0 and then to amount.
        if (!_call(token, abi.encodeWithSelector(IERC20.approve.selector, spender, amount))) {
            require(
                _call(token, abi.encodeWithSelector(IERC20.approve.selector, spender, 0)),
                "SafeERC20/approve-zero-failed"
            );
            require(
                _call(token, abi.encodeWithSelector(IERC20.approve.selector, spender, amount)),
                "SafeERC20/approve-amount-failed"
            );
        }
    }

    /**********************************************************************************************/
    /*** Private Functions                                                                      ***/
    /**********************************************************************************************/

    function _call(address token, bytes memory data_) private returns (bool success) {
        if (token.code.length == 0) return false;

        bytes memory returnData;
        ( success, returnData ) = token.call(data_);

        return success && (returnData.length == 0 || abi.decode(returnData, (bool)));
    }

}
