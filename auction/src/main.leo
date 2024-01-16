program auction.aleo {

    // A data structure to hold bid information
    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    // functions have to use all the parameters passed into them
    function spotemgotem(a: u64, b: u64) -> u64 {
        return a + b;
    }

    // Create a bid -- why have this function if the bids created don't do
    // anything?
    transition place_bid(bidder: address, amount: u64) -> Bid {
        // Ensure the caller is the auction bidder.
        assert_eq(self.caller, bidder);

        let res: u64 = spotemgotem(12u64, 13u64);

        return Bid {
            owner: aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh,
            bidder: bidder,
            amount: amount + res,
            is_winner: false,
        };
    }

    // figures out who wins between two bids
    // TODO: Figure out how to make this work via a network or summ
    transition resolve(first: Bid, second: Bid) -> Bid {
        // make sure the caller is the auctioneer
        assert_eq(self.caller, aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh);

        return first.amount >= second.amount ? first : second;
    }

    // Sets winning to bid to a winning state via the `is_winner` data member
    transition finish(bid: Bid) -> Bid {
        // make sure that the auctioneer is the one calling this function
        assert_eq(self.caller, aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh);

        // set `is_winner` data member to true and be doone
        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }
}
