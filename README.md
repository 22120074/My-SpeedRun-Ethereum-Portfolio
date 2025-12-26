# 🚩 Challenge 1: Decentralized Staking App

This is the first challenge of the Speed Run Ethereum curriculum. The goal is to build a **Decentralized Staking App** (similar to Kickstarter) where users can pool funds together to meet a threshold.

If the threshold is met by the deadline, the funds are sent to an external contract (e.g., to buy a shared asset). If not, users can withdraw their funds.

### 🌟 Live Demo

- **Frontend (Vercel):** [https://challenge-decentralized-staking-six.vercel.app/]

---

## 🚀 Features & Checkpoints Completed

I have successfully completed Checkpoints 1 to 5:

- [x] **Checkpoint 1: Staking Logic**

  - Implemented `stake()` function to allow users to deposit ETH.
  - Tracked individual balances using `mapping`.
  - Emitted `Stake` events for UI updates.

- [x] **Checkpoint 2: State Machine & Timing**

  - Added a `deadline` and `threshold` (1 ETH).
  - Implemented `execute()`:
    - If `Balance >= Threshold` & `Time < Deadline` → Sends funds to External Contract.
    - If `Time > Deadline` & `Not enough funds` → Enables Withdrawal.
  - Created `timeLeft()` helper for the frontend countdown.

- [x] **Checkpoint 3: UX & Withdraw**

  - Implemented `withdraw()` allowing users to reclaim funds if the campaign fails.
  - Added `receive()` function to handle direct ETH transfers to the contract address.
  - Secured against Re-entrancy attacks.

- [x] **Checkpoint 4: Deploy to Testnet**

  - Configured Deployer Wallet.
  - Deployed Smart Contract to **Sepolia Testnet**.
  - Updated deadline logic for real-world usage (72 hours).

- [x] **Checkpoint 5: Ship Frontend**
  - Deployed the Next.js Frontend to **Vercel**.
  - Connected the live DApp to the Sepolia Smart Contract.

---

## 🛠 Tech Stack

- **Solidity:** Smart Contract Logic.
- **Scaffold-ETH 2:** Development framework.
- **Next.js & DaisyUI:** Frontend interface.
- **Hardhat:** Ethereum development environment.
- **Vercel:** Frontend Hosting.
- **Sepolia:** Public Testnet.

---

## 💻 How to Run Locally

1. **Clone the repo & install dependencies:**
   ```bash
   yarn install
   ```
