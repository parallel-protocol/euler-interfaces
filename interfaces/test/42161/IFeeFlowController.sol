// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IFeeFlowController {
    struct Slot0 {
        uint8 locked;
        uint16 epochId;
        uint192 initPrice;
        uint40 startTime;
    }

    error ControllerDisabled();
    error DeadlinePassed();
    error EVC_InvalidAddress();
    error EmptyAssets();
    error EpochIdMismatch();
    error EpochPeriodBelowMin();
    error EpochPeriodExceedsMax();
    error InitPriceBelowMin();
    error InitPriceExceedsMax();
    error MaxPaymentTokenAmountExceeded();
    error MinInitPriceBelowMin();
    error MinInitPriceExceedsAbsMaxInitPrice();
    error NotAuthorized();
    error PaymentReceiverIsThis();
    error PriceMultiplierBelowMin();
    error PriceMultiplierExceedsMax();
    error Reentrancy();

    event Buy(address indexed buyer, address indexed assetsReceiver, uint256 paymentAmount);

    function ABS_MAX_INIT_PRICE() external view returns (uint256);
    function ABS_MIN_INIT_PRICE() external view returns (uint256);
    function EVC() external view returns (address);
    function MAX_EPOCH_PERIOD() external view returns (uint256);
    function MAX_PRICE_MULTIPLIER() external view returns (uint256);
    function MIN_EPOCH_PERIOD() external view returns (uint256);
    function MIN_PRICE_MULTIPLIER() external view returns (uint256);
    function PRICE_MULTIPLIER_SCALE() external view returns (uint256);
    function buy(
        address[] memory assets,
        address assetsReceiver,
        uint256 epochId,
        uint256 deadline,
        uint256 maxPaymentTokenAmount
    ) external returns (uint256 paymentAmount);
    function epochPeriod() external view returns (uint256);
    function getPrice() external view returns (uint256);
    function getSlot0() external view returns (Slot0 memory);
    function minInitPrice() external view returns (uint256);
    function paymentReceiver() external view returns (address);
    function paymentToken() external view returns (address);
    function priceMultiplier() external view returns (uint256);
}
