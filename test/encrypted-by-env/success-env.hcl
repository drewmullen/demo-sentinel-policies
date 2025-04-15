mock "tfplan/v2" {
    module {
        // unecnrypted
        source = "./testdata/tfplan-unencrypted.sentinel"
    }
}

mock "tfrun" {
    module {
        source = "./testdata/tfrun-dev.sentinel"
    }
}


test {
    rules  = {
        main = true
    }
}