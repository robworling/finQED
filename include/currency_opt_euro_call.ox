// file currency_opt_euro_call.cc
// author:  Bernt A Oedegaard

#include <oxstd.h>

currency_option_price_call_european( decl S,      // exchange_rate,
					   decl X,      // exercise,
					   decl r,      // r_domestic,
					   decl r_f,    // r_foreign,
					   decl sigma,  // volatility,
					   decl time)   // time to maturity
{
    decl sigma_sqr = sigma*sigma;
    decl time_sqrt = sqrt(time);
    decl d1 = (log(S/X) + (r-r_f+ (0.5*sigma_sqr)) * time)/(sigma*time_sqrt);
    decl d2 = d1 - sigma * time_sqrt;
    return S * exp(-r_f*time) * probn(d1) - X * exp(-r*time) * probn(d2);
}
