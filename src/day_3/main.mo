import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Debug "mo:base/Debug";

actor {
    /*********************************************************************
    **
    ** Motoko Day 3 Challenge
    ** all work here is the respective work of James Nine*
    **          *except whereever mentioned
    ** jncrypto8@gmail.com
    **
    *********************************************************************/
    


    /*********************************************************************
    **
    ** Challenge 1
    **
    *********************************************************************/
    // Note: this is part of the solution from chal #10 of Day 1
    // but re-written to take mutable arrays
    private func _swap(a : [var Nat], i : Nat, j : Nat) : [var Nat] {
        let tmp = a[i];
        a[i] := a[j];
        a[j] := tmp;
        return(a);
    };

    /*********************************************************************
    **
    ** Challenge 2
    **
    *********************************************************************/
    public func init_count(n : Nat) : async [Nat] {
        let a : [var Nat] = Array.init<Nat>(n,0);

        for(i in Iter.range(0, n - 1)) {
            a[i] := i + 1;
        };

        return(Array.freeze<Nat>(a));
    };

    /*********************************************************************
    **
    ** Challenge 3
    **
    *********************************************************************/
    // Note: call using: dfx canister call day_3 seven '(vec{1;2;3;4})'
    public func seven(a : [Nat]) : async Text {
        for(v in a.vals()) {
            if(v == 7) return "Seven is found";
        };

        return "Seven not found";
    };

    /*********************************************************************
    **
    ** Challenge 4
    **
    *********************************************************************/
    public func nat_opt_to_nat(n : ?Nat, m : Nat) : async ?Nat {
        switch(n) {
            case(null) { return ?(m) }; // Case where n is null
            case(_){ return n }; // Case where n is not null
        };
    };

    /*********************************************************************
    **
    ** Challenge 5
    **
    *********************************************************************/
    public func day_of_the_week(n : Nat) : async ?Text {
        switch(n) {
            case (1) { return ?("Monday") };
            case (2) { return ?("Tuesday") };
            case (3) { return ?("Wednesday") };
            case (4) { return ?("Thursday") };
            case (5) { return ?("Friday") };
            case (6) { return ?("Saturday") };
            case (7) { return ?("Sunday") };
            case (_) { return null };
        }
    };

    /*********************************************************************
    **
    ** Challenge 6
    **
    *********************************************************************/
    // Note: call using: dfx canister call day_3 populate_array '(vec{opt 1;opt 2;opt 3;opt 4})'
    let nconv = func (n : ?Nat) : Nat {
        switch(n) {
            case (null) { return 0 };
            case (?n) { return n };
        }
    };

    public func populate_array(array : [?Nat]) : async [Nat] {
        return(Array.map<?Nat,Nat>(array, nconv));
    };

    /*********************************************************************
    **
    ** Challenge 7
    **
    *********************************************************************/
    var sum_all : Nat = 0;

    let s = func (n : Nat) : Nat {
        sum_all += n;
        return(n);
    };

    public func sum_of_array(array : [Nat]) : async Nat {
        sum_all := 0;
        var r = Array.map<Nat,Nat>(array, s);
        return(sum_all);
    };

    /*********************************************************************
    **
    ** Challenge 8
    **
    *********************************************************************/
    let squared = func (n : Nat) : Nat {
        return(n ** 2);
    };

    public func squared_array(array : [Nat]) : async [Nat] {
        return(Array.map<Nat,Nat>(array, squared));
    };

    /*********************************************************************
    **
    ** Challenge 9
    **
    *********************************************************************/
    var index : Nat = 0;

    let inc = func (n : Nat) : Nat {
        let res = n + index;
        index += 1;
        return(res);
    };

    public func increase_by_index(array : [Nat]) : async [Nat] {
        index := 0;
        return(Array.map<Nat,Nat>(array, inc));
    };

    /*********************************************************************
    **
    ** Challenge 10
    **
    *********************************************************************/
    // not working
    let f = func (n : T) : Bool {
        if(n == 'a') {
            return true;
        } else {
            return false;
        }
    };

    public func contains<A>(array : [A], a : A, f : (A,A)) : async Bool {
        return(Array.find<Nat>(array, f));
    };
    
};
