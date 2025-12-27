# 🚩 Challenge 1: Decentralized Staking App

This is the first challenge of the Speed Run Ethereum curriculum. The goal is to build a **Decentralized Staking App** (similar to Kickstarter) where users can pool funds together to meet a threshold.

If the threshold is met by the deadline, the funds are sent to an external contract (e.g., to buy a shared asset). If not, users can withdraw their funds.

### 🌟 Live Demo

- **Frontend (Vercel):** [https://challenge-decentralized-staking-six.vercel.app/]

---

## 🚀 Features & Checkpoints Completed

I have successfully completed Checkpoints 1 to 6

---

## 💻 How to Run Locally

1. **Clone the repo & install dependencies:**

```bash
yarn install
```

2. **How to run the code:**

```bash
# CMD 1
yarn chain
```

```bash
# CMD 2
yarn deloy --reset
yarn deloy
```

```bash
# CMD 3
yarn start
```

3. **Test in FE:**

Lấy tiền từ Ví - [Wallet] rồi đến "Stacker UI" và kiểm tra The Contact mà mình deloy lên.
Hoặc là đi đến Debug Contact để có thểm nhiều thông tin và hàm.

Sau đó bạn có thể Stack tiền vào Stacker Contact, Nếu đến hạn mà đủ quỹ thì Excute, còn không thì nhấn Excute rồi Withdraw để nhận tiền.

# 🚩 Challenge 2: 🏵 Token Vendor 🤖

This is the second challenge of the Speed Run Ethereum curriculum. The goal is to build a **Token Vendor** (like a Vending Machine) that handles the buying and selling of your own ERC20 token using ETH.

Users can exchange ETH for tokens and vice versa. It involves handling `approve` patterns for ERC20 transfers and managing contract balances.

### 🌟 Live Demo

- **Frontend (Vercel):** [https://challenge-token-vendor.vercel.app/]

---

## 🚀 Features & Checkpoints Completed

I have successfully completed Checkpoints 1 to 6

**Alert**:

Ở Checkpoint 2 nên có đủ ETH để có thể giao dịch. Nếu Vendor muốn có token phải lấy từ Deloyer, mà trước đó ta phải mint vào Deloyer lẫn Ví Frontend.

---

## 💻 How to Run Locally

1. **Clone the repo & install dependencies:**

```bash
yarn install
```

2. **How to run the code:**

```bash
# CMD 1
yarn chain
```

```bash
# CMD 2
yarn deloy --reset
yarn deloy
```

```bash
# CMD 3
yarn start
```

3. **Test in FE:**

Bạn có thể mua Token hoặc là bán Token cho Vendor, mọi phương thức đều cần ETH. Sau đó nếu bạn là người Owner bạn còn có thể rút tiền từ Vendor về Ví - [Wallet] của mình
