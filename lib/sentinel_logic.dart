enum SentinelDecision { AllowLearn, NoLearn, Hold, Stop }

class Sentinel {
  static Map<String, dynamic> evaluate(String input, {String? lastInput}) {
    SentinelDecision decision = SentinelDecision.AllowLearn;
    String reason = "資訊性互動 / 低風險";
    bool allowResponse = true;

    String lowerInput = input.toLowerCase();

    List<String> highRisk = ["非法", "攻擊", "作弊", "危險"];

    if (highRisk.any((k) => lowerInput.contains(k))) {
      decision = SentinelDecision.Stop;
      reason = "高誘導風險";
      allowResponse = false;
    } else if (lastInput != null &&
        lastInput.toLowerCase() != lowerInput &&
        (lowerInput.contains("矛盾") || lowerInput.contains("不一致"))) {
      decision = SentinelDecision.Hold;
      reason = "使用者行為不一致";
      allowResponse = true;
    } else if (lowerInput.contains("請") ||
        lowerInput.contains("幫我") ||
        lowerInput.contains("查詢")) {
      decision = SentinelDecision.AllowLearn;
      reason = "資訊性互動 / 低風險";
      allowResponse = true;
    } else {
      decision = SentinelDecision.NoLearn;
      reason = "回應允許，學習禁止";
      allowResponse = true;
    }

    return {
      "decision": decision,
      "reason": reason,
      "allowResponse": allowResponse
    };
  }
}
